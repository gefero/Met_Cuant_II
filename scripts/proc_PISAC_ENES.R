library(foreign)
library(tidyverse)
df<-read.spss('./data/ENES_psh_cony.sav', to.data.frame=TRUE)


df %>%
        filter(v213b > 0 & v213b < 50000) %>%
        ggplot() + 
                geom_point(aes(x=v108, y=v213b)) +
                geom_smooth(aes(x=v108, y=v213b), method='loess') +
                facet_wrap(~EOW_class) +
        
                labs(x='Edad', y='Ingreso de la ocupación principal',
                     title='Ingresos de la ocupación principal según edad por CSO (Torrado)',
                     caption='Fuente: ENES-PISAC')
        

df %>%
        filter(v213b > 0 & v213b < 50000) %>%
        ggplot() + 
        geom_point(aes(x=v190, y=v213b)) +
        geom_smooth(aes(x=as.numeric(v190), y=v213b), method='lm') +
        facet_wrap(~EOW_class) +
        labs(x='Antigüedad en el empleo', y='Ingreso de la ocupación principal')


summary(lm(v213b ~ CSO.y + EOW_class + v190 + v190, data=df))


