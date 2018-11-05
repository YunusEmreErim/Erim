#1

View(iris)

ggplot(data = iris) + 
  geom_point(mapping = aes(x = Sepal.Length, y = Sepal.Width, color= Species, shape= Species)) + 
  geom_density2d(mapping = aes(x = Sepal.Length, y = Sepal.Width, color= Species)) +
  ggtitle("IRIS") +
  theme_light()


#2

data = iris %>%mutate(Species = 'ALL') %>% bind_rows(iris)

ggplot(data = data) + 
  geom_point(mapping = aes(x = Petal.Length, y = Petal.Width, color=Species)) + 
  geom_smooth(mapping = aes(x = Petal.Length, y = Petal.Width, color=Species)) +
  facet_wrap(.~ Species, nrow = 2, scales= "free") +
  xlab("Pedal.Length") +
  ylab("Pedal Width")

#3

data = mtcars %>%rownames_to_column() %>%mutate(rowname =
                                                  forcats::fct_reorder(rowname, mpg))
ggplot(data=data, aes(x=mpg, y=rowname)) +
  geom_point() +
  geom_text(label= data$rowname, hjust= "left", nudge_x=0.5) +
  theme(axis.title.y=element_blank(), 
        axis.text.y=element_blank(), 
        axis.ticks.y=element_blank())


#4

data=mtcars
ggplot(data) + 
  geom_point(mapping= aes(x=mpg, y=qsec, size=disp, color= factor(am))) +
  labs(x= "Miles per gallon", y= "1/4 mile time") +
  scale_size_continuous(name="Displacement")+
  scale_color_discrete(name="Gear", 
                       breaks= c(0,1), 
                       labels= c("Manual","Automatic"))
  


#6

data=economics

i <- ggplot(economics, aes(date, uempmed))
i+geom_line()+ labs(title="Median Duration of unemployment [weeks]")









