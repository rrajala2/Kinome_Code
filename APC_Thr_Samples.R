setwd("C:/Users/rahul/Dropbox (OMRF)/Rahul's Folder/Experiments/2023/2-20-22 Cantley-Thrombin-APC")

library(EnhancedVolcano)

APC <- read.delim("C:/Users/rahul/Dropbox (OMRF)/Rahul's Folder/Experiments/2023/2-20-22 Cantley-Thrombin-APC/APC_Kinases.txt")
Thr <- read.delim("C:/Users/rahul/Dropbox (OMRF)/Rahul's Folder/Experiments/2023/2-20-22 Cantley-Thrombin-APC/Thrombin_.txt")

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



write.csv(x = APC_UP, file ="APC_UP.csv")
write.csv(x = APC_DN, file ="APC_DN.csv")
write.csv(x = Thr_UP, file ="Thr_UP.csv")
write.csv(x = Thr_DN, file ="Thr_DN.csv")
