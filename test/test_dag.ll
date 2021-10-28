define i32 @test(i32 %a, i32 %b, i32 %c) {
  %node1 = add nsw i32 %a, %b
  %node2 = mul i32 %node1, 1
  ret i32 %node2
}