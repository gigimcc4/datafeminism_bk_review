vtop_terms%>%
  mutate(term = reorder_within(term,beta, topic))%>%
  group_by(topic, term)%>%
  arrange(desc(beta))%>%
  ungroup%>%
  ggplot(aes(beta, term, fill = as.factor(topic))) +
  geom_col(show.legend = FALSE) +
  scale_y_reordered() +
  labs(title = "Top 6 terms in each LDA topic",
       x= expression(beta), y = NULL) +
  facet_wrap(~topic, ncol = 4, scales = "free")


#circilize histogram for distribution of topic in each 


suppressPackageStartupMessages(library(circlize))
circos.par("track.height" = 0.4)
circos.clear() 
circos.initialize(lda_gamma$gamma, ylim = ylim)
circos.trackHist(lda_gamma$gamma, lda_gamma$topic, track.height = 0.1, col = "blue", border = NA, bin.size = 5, force.ylim = NULL)
text(0,0, "Distribution of probability\nfor each topic")
circos.clear()

I'm also going to take the top 5 terms from each topic and concatenate it into a string for better understanding and use later on.