use context dcic2024
data SensorNet:
  |hub(bandwith :: Number, left :: SensorNet, right :: SensorNet)
  |sensor(rate :: Number)
end

# Example network
sA = sensor(60)
sB = sensor(120)
sC = sensor(45)

# You can construct larger networks like:
hub1 = hub(150, sA, sB)
core = hub(200, hub1, sC)


fun total-load(n :: SensorNet) -> Number:
  cases (SensorNet) n:
|hub(bandwith :: Number, left :: SensorNet, right :: SensorNet) =>
  total-load(left) + total-load(right)
|sensor(rate :: Number) => rate
end
where:
total-load(core) is 225
end


fun fits-cap(n :: SensorNet) -> Boolean:
  cases (SensorNet) n:
    |sensor(rate :: Number) => true
    |hub(bandwith :: Number, left :: SensorNet, right :: SensorNet) => 
      if bandwith >= total-load(n):
        false
      else:
        true
      end
  end
where:
  fits-cap(hub(150, sA, sB)) is false
  fits-cap(hub(200, sA, sC)) is true
end