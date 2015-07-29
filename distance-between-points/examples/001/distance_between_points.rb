def distance(point1, point2)
  x1 = point1[0]
  y1 = point1[1]
  x2 = point2[0]
  y2 = point2[1]

  a = (x2 - x1) ** 2
  b = (y2 - y1) ** 2

  Math.sqrt(a + b).round(3)
end
