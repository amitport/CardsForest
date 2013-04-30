calculateCascade = (containerSize, itemSize, numOfItems, step, minimalStep) ->
  #  nothing to do here
  if numOfItems is 0 or
     step is 0 or
     minimalStep > step or
     step > itemSize or
     itemSize > containerSize
    return -> 0
    
  #  everything fits in the container
  if itemSize + numOfItems * step <= containerSize
    return (i) -> step * i
  
  #I)  must fit in the container:
  #     itemSize + X * step + Y * minimalStep  <= containerSize
  #II) must use all items
  #     1 + X + Y = numOfItems
  #-->  Y = numOfItems - 1 - X
  #-->  X <= ((containerSize - itemSize) -  minimalStep * (numOfItems - 1)) / (step - minimalStep)
  #-->  maxX = floor(X)
  #-->  minY =  numOfItems - 1 - maxX
  
  #-->
  minY = numOfItems - 1 - Math.floor(((containerSize - itemSize) -  minimalStep * (numOfItems - 1)) / (step - minimalStep))
  if minY <= 0
    return (i) -> step * i
    
  return (i) ->
    if i <= minY
      return minimalStep * i
    else 
      return minimalStep * minY + step * (i - minY)