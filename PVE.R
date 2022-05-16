m = read.table('syt/m3_nums.txt',header=T,stringsAsFactors=F)

pve = function(f){
  phe = read.table(f,header=T,stringsAsFactors=F)
  d = merge(x=phe,y=m,by.x='Compound',by.y='rs')
  colnames(d) = c('Line','phe','marker')
  d[1:3,]
  
  pve_lm = lm(d$phe~d$marker)
  res = summary(pve_lm)
  print(res$adj.r.squared)
}

pve('syt/1.txt')
pve('syt/11.txt')
pve('syt/12.txt')
pve('syt/16.txt')