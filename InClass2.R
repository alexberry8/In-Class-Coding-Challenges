#### Question 2 ####

library(ggplot2)
MycotoxinData <- read.csv("/Users/alexberry/Desktop/MycotoxinData.csv", na.strings = "na")

# Box Plot for the Mycotoxin Dataset
ggplot(MycotoxinData, aes(x = Treatment, y = DON, color = Cultivar)) +
  geom_boxplot() +
  labs(y = "DON (ppm)", x = "")

#### Question 3 ####

# Box Plot with SE Bars
ggplot(MycotoxinData, aes(x = Treatment, y = DON, fill = Cultivar)) +
  stat_summary(fun = mean, geom = "bar", position = position_dodge()) +
  stat_summary(fun.data = mean_se, geom = "errorbar", position = position_dodge(width = 0.9)) +
  labs(y = "DON (ppm)", x = "")

#### Question 4 ####

# Distribution of Individual Data Points Over Box Plots
ggplot(MycotoxinData, aes(x = Treatment, y = DON, color = Cultivar)) +
  geom_boxplot(outlier.shape = NA) +
  geom_jitter(aes(fill = Cultivar), shape = 21, color = "black") +
  labs(y = "DON (ppm)", x = "")

#### Question 5 ####

# Change Color of of Individual Data Points
cbbPalette <- c("#000000", "#E69F00", "#56B4E9", "#009E73", "#F0E442", "#0072B2", "#D55E00", "#CC79A7")
ggplot(MycotoxinData, aes(x = Treatment, y = DON, fill = Cultivar)) +
  geom_boxplot(outlier.shape = NA) +
  scale_fill_manual(values = cbbPalette) +
  labs(y = "DON (ppm)", x = "") +
  geom_point(position = position_jitterdodge(), shape = 21, color = "black")


#### Question 6 ####

# Adding a Facet to the Plots Based on Cultivar
ggplot(MycotoxinData, aes(x = Treatment, y = DON, fill = Cultivar)) +
  geom_boxplot(outlier.shape = NA) +
  geom_jitter(aes(fill = Cultivar), shape = 21, color = "black") +
  scale_fill_manual(values = cbbPalette) +
  facet_wrap(~Cultivar) +
  labs(y = "DON (ppm)", x = "")

#### Question 7 ####

# Add Transparent Points so Box Plot is Still Visible
ggplot(MycotoxinData, aes(x = Treatment, y = DON, fill = Cultivar)) +
  geom_boxplot(outlier.shape = NA, color = "black") +
  geom_jitter(aes(fill = Cultivar), shape = 21, color = "black", alpha = 0.5) +
  scale_fill_manual(values = cbbPalette) +
  facet_wrap(~Cultivar) +
  labs(y = "DON (ppm)", x = "")


#### Question 8 ####

# Alternative Plot - Violin Plot for Mycotoxin Dataset
ggplot(MycotoxinData, aes(x = Treatment, y = DON, fill = Cultivar)) +
  geom_violin(color = "black") +
  geom_jitter(aes(fill = Cultivar), shape = 21, color = "black", alpha = 0.5) +
  scale_fill_manual(values = cbbPalette) +
  facet_wrap(~Cultivar) +
  labs(y = "DON (ppm)", x = "")

# You use a violin plot as another way to plot distribution of your data.
# Since this plot does not look good with this data set, I would not use it and would opt for another type of plot.




