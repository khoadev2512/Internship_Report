# method như yêu cầu như sau:
# - Nhận vào 1 số n (số nguyên dương lớn hơn 0), và số nguyên m (chỉ chứa 1 trong 2 giá trị là 2 hoặc 3)
# - Trả về 1 mảng string gồm n phần tử
# - Mỗi phần tử trong mảng phải thoả điều kiện sau: là một chuỗi chứa bài toán +/- các số có tối đa 2 chữ số (kết quả của phép toán nhở hơn hoặc bằng 100), số lượng các số trong bài toán phụ thuộc vào m (m bằng 2 có nghĩa là +/- 2 số với nhau, bằng 3 là +/- 3 số với nhau)
# - Các bài toán trả về không được trùng nhau, kết quả của bài toán là số nguyên dương không quá 100
# Ví dụ:
# - your_method(2, 2) => [‘4 + 5’, ‘54 - 47’]
# - your_method(2, 3) => [‘89 - 23 + 1’, ‘74 + 2 + 11’]

def generateMath(n,m)
  result = []
  op = ['+','-','/']
  while n > result.size
    num = (1..100).sample(m)
  end
end

