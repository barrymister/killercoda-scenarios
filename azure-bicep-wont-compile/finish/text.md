# Fixed

The `Error BCP057` meant a symbol was referenced but never declared. Declaring
`skuName` as a parameter resolved it and the template compiled. Reading the
compiler's file/line/column is the whole skill.
