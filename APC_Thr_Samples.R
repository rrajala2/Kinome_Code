setwd("C:/Users/rahul/OMRF Dropbox/Rahul Rajala/Rahul Manuscripts/Rahul Kinome Letter/VPH/DATA")

library(EnhancedVolcano)

APC <- read.delim("C:/Users/rahul/OMRF Dropbox/Rahul Rajala/Rahul Manuscripts/Rahul Kinome Letter/VPH/DATA/APC_Kinases.txt")
Thr <- read.delim("C:/Users/rahul/OMRF Dropbox/Rahul Rajala/Rahul Manuscripts/Rahul Kinome Letter/VPH/DATA/Thrombin_Kinases.txt")

#APC_UP <- APC[APC$dominant_direction == 'upregulated set' & APC$upregulated_enrichment_value_log2 > 0.6 & APC$upregulated_adjusted_p_value < 0.05,]
#APC_DN <- APC[APC$dominant_direction == 'downregulated set' & APC$downregulated_enrichment_value_log2 < -0.6 & APC$downregulated_adjusted_p_value < 0.05,]
#Thr_UP <- Thr[Thr$dominant_direction == 'upregulated set' & Thr$upregulated_enrichment_value_log2 > 0.6 & Thr$upregulated_adjusted_p_value < 0.05,]
#Thr_DN <- Thr[Thr$dominant_direction == 'downregulated set' & Thr$downregulated_enrichment_value_log2 < -0.6 & Thr$upregulated_adjusted_p_value < 0.05,]
          
APC_UP <- APC[APC$dominant_enrichment_value_log2 > 0.6 & APC$dominant_adjusted_p_value < 0.05,]
APC_DN <- APC[APC$dominant_enrichment_value_log2 < -0.6 & APC$dominant_adjusted_p_value < 0.05,]
Thr_UP <- Thr[Thr$dominant_enrichment_value_log2 > 0.6 & Thr$dominant_adjusted_p_value < 0.05,]
Thr_DN <- Thr[Thr$dominant_enrichment_value_log2 < -0.6 & Thr$dominant_adjusted_p_value < 0.05,]

EnhancedVolcano(APC, lab = APC$kinase , x = 'dominant_enrichment_value_log2', y = 'dominant_adjusted_p_value', pCutoff = 0.05, FCcutoff = 0.6, title = "Kinase Activity (aPC)")
EnhancedVolcano(Thr, lab = Thr$kinase , x = 'dominant_enrichment_value_log2', y = 'dominant_adjusted_p_value', pCutoff = 0.05, FCcutoff = 0.6, title = "Kinase Activity (Thrombin)")

APC_Y <- read.delim("C:/Users/rahul/OMRF Dropbox/Rahul Rajala/Rahul Manuscripts/Rahul Kinome Letter/VPH/DATA/Tyr-PAR1-aPC.txt")
Thr_Y <- read.delim("C:/Users/rahul/OMRF Dropbox/Rahul Rajala/Rahul Manuscripts/Rahul Kinome Letter/VPH/DATA/Tyr-PAR1-Thrombin.txt")

APC_Y_UP <- APC_Y[APC_Y$dominant_enrichment_value_log2 > 0.6 & APC_Y$dominant_p_value < 0.1,]
APC_Y_DN <- APC_Y[APC_Y$dominant_enrichment_value_log2 < -0.6 & APC_Y$dominant_p_value < 0.1,]
Thr_Y_UP <- Thr_Y[Thr_Y$dominant_enrichment_value_log2 > 0.6 & Thr_Y$dominant_p_value < 0.1,]
Thr_Y_DN <- Thr_Y[Thr_Y$dominant_enrichment_value_log2 < -0.6 & Thr_Y$dominant_p_value < 0.1,]

EnhancedVolcano(APC_Y, lab = APC_Y$kinase , x = 'dominant_enrichment_value_log2', y = 'dominant_p_value', pCutoff = 0.1, FCcutoff = 0.6, title = "Kinase Activity (aPC)")
EnhancedVolcano(Thr_Y, lab = Thr_Y$kinase , x = 'dominant_enrichment_value_log2', y = 'dominant_p_value', pCutoff = 0.1, FCcutoff = 0.6, title = "Kinase Activity (Thrombin)")


write.csv(x = APC_Y_UP, file ="APC_Y_UP.csv")
write.csv(x = APC_Y_DN, file ="APC_Y_DN.csv")
write.csv(x = Thr_Y_UP, file ="Thr_Y_UP.csv")
write.csv(x = Thr_Y_DN, file ="Thr_Y_DN.csv")
