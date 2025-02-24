mycotoxin <- read.csv("/Users/alexberry/Desktop/MycotoxinData.csv", na.strings="na")
cbbPalette <- c("#000000", "#E69F00", "#56B4E9", "#009E73", "#F0E442", "#0072B2", "#D55E00", "#CC79A7")
library(ggplot2)
library(ggpubr)

### Question 1 - Create a Box Plot
boxplot <- ggplot(mycotoxin, aes(x = Treatment, y = DON, fill = Cultivar, color = Cultivar)) +
  geom_boxplot(outlier.shape = NA, position = position_dodge()) +  
  geom_point(position = position_jitterdodge(0.9), alpha = 0.6, shape = 21, color = "black") +
  scale_fill_manual(values = c("Ambassador" = "#56B4E9", "Wheaton" = "#009E73")) + 
  scale_color_manual(values = c("Ambassador" = "#56B4E9", "Wheaton" = "#009E73")) +
  labs(y = "DON (ppm)", x = "") +  
  theme_classic() +  
  facet_wrap(~Cultivar) 
boxplot

### Question 2 - Reorder Treatment Levels
mycotoxin$Treatment <- factor(mycotoxin$Treatment, levels = c("NTC", "Fg", "Fg + 37", "Fg + 40", "Fg + 70"))
boxplot1 <- ggplot(mycotoxin, aes(x = Treatment, y = DON, fill = Cultivar, color = Cultivar)) +
  geom_boxplot(outlier.shape = NA, position = position_dodge()) +  
  geom_point(position = position_jitterdodge(0.9), alpha = 0.6, shape = 21, color = "black") +
  scale_fill_manual(values = c("Ambassador" = "#56B4E9", "Wheaton" = "#009E73")) + 
  scale_color_manual(values = c("Ambassador" = "#56B4E9", "Wheaton" = "#009E73")) +
  labs(y = "DON (ppm)", x = "") +  
  theme_classic() +  
  facet_wrap(~Cultivar) 
boxplot1

### Question 3 - X15ADON and MassperSeed_mg Plots
# X15ADON Plot
boxplot2 <- ggplot(mycotoxin, aes(x = Treatment, y = X15ADON, fill = Cultivar, color = Cultivar)) +
  geom_boxplot(outlier.shape = NA, position = position_dodge()) +  
  geom_point(position = position_jitterdodge(0.9), alpha = 0.6, shape = 21, color = "black") +
  scale_fill_manual(values = c("Ambassador" = "#56B4E9", "Wheaton" = "#009E73")) + 
  scale_color_manual(values = c("Ambassador" = "#56B4E9", "Wheaton" = "#009E73")) +
  labs(y = "X15ADON", x = "") +  
  theme_classic() +  
  facet_wrap(~Cultivar) 
boxplot2

# MassperSeed_mg Plot
boxplot3 <- ggplot(mycotoxin, aes(x = Treatment, y = MassperSeed_mg, fill = Cultivar, color = Cultivar)) +
  geom_boxplot(outlier.shape = NA, position = position_dodge()) +  
  geom_point(position = position_jitterdodge(0.9), alpha = 0.6, shape = 21, color = "black") +
  scale_fill_manual(values = c("Ambassador" = "#56B4E9", "Wheaton" = "#009E73")) + 
  scale_color_manual(values = c("Ambassador" = "#56B4E9", "Wheaton" = "#009E73")) +
  labs(y = "MassperSeed_mg", x = "") +  
  theme_classic() +  
  facet_wrap(~Cultivar) 
boxplot3

### Question 4 - Combine all Three Plots
boxplot1 <- boxplot1 + theme(axis.text.x = element_text(angle = 45, hjust = 1))
boxplot2 <- boxplot2 + theme(axis.text.x = element_text(angle = 45, hjust = 1))
boxplot3 <- boxplot3 + theme(axis.text.x = element_text(angle = 45, hjust = 1))
combinedplot <- ggarrange(boxplot1, boxplot2, boxplot3, labels = "auto", nrow = 1, ncol = 3, common.legend = T)
combinedplot

### Question 5 - Add T-Test and Rearrange all Three Plots
# boxplot1
boxplot1_ttest <- boxplot1 + 
  geom_pwc(aes(group = Treatment), method = "t.test", label = "p.adj.format")
boxplot1_ttest

# boxplot2
boxplot2_ttest <- boxplot2 + 
  geom_pwc(aes(group = Treatment), method = "t.test", label = "p.adj.format")
boxplot2_ttest

# boxplot3
boxplot3_ttest <- boxplot3 + 
  geom_pwc(aes(group = Treatment), method = "t.test", label = "p.adj.format")
boxplot3_ttest

# Combine all Three Plots with P-Values
combinedplot2 <- ggarrange(boxplot1_ttest, boxplot2_ttest, boxplot3_ttest, labels = "auto", nrow = 1, ncol = 3, common.legend = T)
combinedplot2



