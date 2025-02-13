
data("mtcars")

str(mtcars)

### plotting examples using Base R
plot(mtcars$wt, mtcars$mpg,
     xlab = "Car Weight",
     ylab = "Miles per gallon",
     font.lab = 6,
     pch = 23)


#### GGPLOT2 ####
library(ggplot2)

ggplot(mtcars, aes(x = wt, y = mpg)) +
  geom_smooth(method = lm, se = FALSE, color = "grey") +
  geom_point(aes(size = cyl, color = hp)) +
  xlab("log10 Weight") +
  ylab("Miles per gallon") +
  scale_color_gradient(low = "green", high = "black") +
  scale_x_log10()


# ggplot with categorical X and numeric Y variables

file.choose()

bull.richness <- read.csv("/Users/alexberry/Downloads/Bull_richness.csv")
str(bull.richness)

bull.richness.soy.no.till <- bull.richness[bull.richness$Crop == "Soy" &
                                             bull.richness$Treatment == "No-till",]

# box plot
ggplot(bull.richness.soy.no.till, aes(x = GrowthStage, y = richness, color = Fungicide)) +
  geom_boxplot() +
  xlab("") +
  ylab("Fungal Richness") +
  geom_point(position = position_jitterdodge(dodge.width = 0.9))

# bar plot
ggplot(bull.richness.soy.no.till, aes(x = GrowthStage, y = richness, color = Fungicide, fill = Fungicide)) +
  geom_point(position = position_jitterdodge(dodge.width = 0.9)) +
  stat_summary(fun=mean, geom = "bar", position = "dodge") +
  stat_summary(fun.data = mean_se, geom = "errorbar", position = "dodge") +
  xlab("") +
  ylab("Fungal Richness")

# lines
ggplot(bull.richness.soy.no.till, aes(x = GrowthStage, y = richness, group = Fungicide, color = Fungicide)) +
  stat_summary(fun=mean, geom = "line") +
  stat_summary(fun.data = mean_se, geom = "errorbar") +
  xlab("") +
  ylab("Fungal Richness")

# faceting
ggplot(bull.richness, aes(x = GrowthStage, y = richness, group = Fungicide, color = Fungicide)) +
  stat_summary(fun=mean, geom = "line") +
  stat_summary(fun.data = mean_se, geom = "errorbar") +
  xlab("") +
  ylab("Fungal Richness") +
  facet_wrap(~Treatment*Crop, scales = "free")





