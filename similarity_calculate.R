TS_1_TS_2_616 <- read.table("616_TS-1_TS-2_SNP.table",header = T)
TS_177_TS_523_616 <- read.table("616_TS-177_TS-523.table",header = T)
colnames(TS_1_TS_2_616) <- c("CHROM", "POS", "REF", "ALT", "t_616", "TS-1", "TS-2")
colnames(TS_177_TS_523_616) <- c("CHROM", "POS", "REF", "ALT", "t_616", "TS-523", "TS-177")

TS_1_TS_2_616_clear <- TS_1_TS_2_616[((TS_1_TS_2_616$`TS-2` != "./." & 
                                         TS_1_TS_2_616$`TS-2` != ".|.") & 
                                       (TS_1_TS_2_616$`TS-1` != "./." & 
                                          TS_1_TS_2_616$`TS-1` != ".|.") & 
                                       (TS_1_TS_2_616$t_616 != "./." & 
                                          TS_1_TS_2_616$t_616 != ".|.")), ]

TS_177_TS_523_616_clear <- TS_177_TS_523_616[((TS_177_TS_523_616$`TS-177` != "./." & 
                                                 TS_177_TS_523_616$`TS-177` != ".|.") & 
                                                (TS_177_TS_523_616$`TS-523` != "./." & 
                                                   TS_177_TS_523_616$`TS-523` != ".|.") & 
                                                (TS_177_TS_523_616$t_616 != "./." & 
                                                   TS_177_TS_523_616$t_616 != ".|.")), ]

similarity_calculate <- function(p_SNP, o_SNP){
  SNP_1 <- data.frame(matrix(unlist(strsplit(p_SNP,split = "|")), ncol = 3, byrow = T))
  SNP_2 <- data.frame(matrix(unlist(strsplit(o_SNP,split = "|")), ncol = 3, byrow = T))
  similarity <- sum(SNP_1$X1 == SNP_2$X3 | SNP_1$X3 == SNP_2$X3 |
                      SNP_1$X1 == SNP_2$X1 | SNP_1$X3 == SNP_2$X1) / nrow(SNP_1)
  return(similarity)
}
TS_177_616 <- similarity_calculate(TS_177_TS_523_616_clear$`TS-177`, TS_177_TS_523_616_clear$t_616)
TS_523_616 <- similarity_calculate(TS_177_TS_523_616_clear$`TS-523`, TS_177_TS_523_616_clear$t_616)
TS_1_616 <- similarity_calculate(TS_1_TS_2_616_clear$`TS-1`, TS_1_TS_2_616_clear$t_616)
TS_2_616 <- similarity_calculate(TS_1_TS_2_616_clear$`TS-2`, TS_1_TS_2_616_clear$t_616)

similarity <- data.frame(rbind(TS_1_616, TS_2_616, TS_177_616, TS_523_616))

write.table(similarity,"similarity.txt", quote = F,col.names = F)

#test
if(FALSE){
  TS_177 <- data.frame(matrix(unlist(strsplit(TS_177_TS_523_616_clear$`TS-177`,split = '|')), 
                              ncol=3, byrow = T))
  t_616 <- data.frame(matrix(unlist(strsplit(TS_177_TS_523_616_clear$t_616,split = '|')), 
                             ncol=3, byrow = T))
  similarity <- sum(TS_177$X1 == t_616$X1 | TS_177$X3 == t_616$X3 | 
                      TS_177$X3 == t_616$X1 | TS_177$X1 == t_616$X3)
}