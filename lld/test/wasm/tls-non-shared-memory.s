# Test that linking without shared memory causes __tls_base to be
# internalized.

# RUN: llvm-mc -filetype=obj -triple=wasm32-unknown-unknown -o %t.o %s

.globaltype __tls_base, i32

.globl get_tls1
get_tls1:
  .functype get_tls1 () -> (i32)
  global.get __tls_base
  i32.const tls1@TLSREL
  i32.add
  end_function

.globl get_tls1_got
get_tls1_got:
  .functype get_tls1_got () -> (i32)
  global.get tls1@GOT@TLS
  end_function

.section  .data.no_tls,"",@
.globl  no_tls
.p2align  2
no_tls:
  .int32  42
  .size no_tls, 4

.section  .tdata.tls1,"T",@
.globl  tls1
.p2align  2
tls1:
  .int32  43
  .size tls1, 2

.section  .custom_section.target_features,"",@
  .int8 2
  .int8 43
  .int8 7
  .ascii  "atomics"
  .int8 43
  .int8 11
  .ascii  "bulk-memory"

# RUN: wasm-ld --no-gc-sections --no-entry -o %t.wasm %t.o
# RUN: obj2yaml %t.wasm | FileCheck %s

# RUN: wasm-ld --experimental-pic -shared -o %t.so %t.o
# RUN: obj2yaml %t.so | FileCheck %s --check-prefix=PIC

#      CHECK:   - Type:            GLOBAL
# __stack_pointer
# CHECK-NEXT:     Globals:
# CHECK-NEXT:       - Index:           0
# CHECK-NEXT:         Type:            I32
# CHECK-NEXT:         Mutable:         true
# CHECK-NEXT:         InitExpr:
# CHECK-NEXT:           Opcode:          I32_CONST
# CHECK-NEXT:           Value:           66576
# __tls_base
# CHECK-NEXT:       - Index:           1
# CHECK-NEXT:         Type:            I32
# CHECK-NEXT:         Mutable:         false
# CHECK-NEXT:         InitExpr:
# CHECK-NEXT:           Opcode:          I32_CONST
# CHECK-NEXT:           Value:           1024
# GOT.data.internal.tls1
# CHECK-NEXT:       - Index:           2
# CHECK-NEXT:         Type:            I32
# CHECK-NEXT:         Mutable:         false
# CHECK-NEXT:         InitExpr:
# CHECK-NEXT:           Opcode:          I32_CONST
# CHECK-NEXT:           Value:           1024
# CHECK-NEXT:   - Type:            EXPORT

#      CHECK:  - Type:            DATA
# .data
# CHECK-NEXT:    Segments:
# CHECK-NEXT:      - SectionOffset:   7
# CHECK-NEXT:        InitFlags:       0
# CHECK-NEXT:        Offset:
# CHECK-NEXT:          Opcode:          I32_CONST
# CHECK-NEXT:          Value:           1024
# CHECK-NEXT:        Content:         2B000000
# .tdata
# CHECK-NEXT:      - SectionOffset:   17
# CHECK-NEXT:        InitFlags:       0
# CHECK-NEXT:        Offset:
# CHECK-NEXT:          Opcode:          I32_CONST
# CHECK-NEXT:          Value:           1028
# CHECK-NEXT:        Content:         2A000000
# CHECK-NEXT:  - Type:            CUSTOM


# In PIC mode we expect TLS data and non-TLS data to be merged into
# a single segment which is initialized via the  __memory_base import

#      PIC:  - Type:            IMPORT
# PIC-NEXT:    Imports:
# PIC-NEXT:      - Module:          env
# PIC-NEXT:        Field:           memory
# PIC-NEXT:        Kind:            MEMORY
# PIC-NEXT:        Memory:
# PIC-NEXT:          Minimum:         0x1
# PIC-NEXT:      - Module:          env
# PIC-NEXT:        Field:           __memory_base
# PIC-NEXT:        Kind:            GLOBAL
# PIC-NEXT:        GlobalType:      I32

# .tdata and .data are combined into single segment in PIC mode.
#      PIC:  - Type:            DATA
# PIC-NEXT:    Segments:
# PIC-NEXT:      - SectionOffset:   6
# PIC-NEXT:        InitFlags:       0
# PIC-NEXT:        Offset:
# PIC-NEXT:          Opcode:          GLOBAL_GET
# PIC-NEXT:          Index:           0
# PIC-NEXT:        Content:         2B0000002A000000
# PIC-NEXT:  - Type:            CUSTOM
