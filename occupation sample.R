
gg.byyear <- BostonWomenVoters %>% filter(occupation == "Housewife") %>% group_by(Year)
%>% summarize(count = n())
gg.byoccupation
ggplot(data = gg.byoccupation, mapping = aes(x=occupationalStatus, y=count())) + geom_col(color="purple") + facet_wrap(~occupationalStatus)
