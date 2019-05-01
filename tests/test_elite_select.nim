import unittest
from objects/basic import Gene


proc getSmapleGenes(n=10): seq[Gene] =
  result = @[]
  for i in 0..<n:
    result.add(Gene(chrom: @[1,2,3,4,5], score: 0.1))


from elite/select import runSelect
test "Can select some elite":
  var
    sampleGenes = getSmapleGenes()
    selectedGenes: seq[Gene]
  selectedGenes = runSelect(sampleGenes, 1)
  check selectedGenes.len == 1
  selectedGenes = runSelect(sampleGenes, 3)
  check selectedGenes.len == 3