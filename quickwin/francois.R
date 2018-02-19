library(RCurl)
library(dplyr)

a <- getURL("https://declarations.cnil.fr/declarations-a-b.csv")
b <- getURL("https://declarations.cnil.fr/declarations-c.csv")
c <- getURL("https://declarations.cnil.fr/declarations-d-f.csv")
d <- getURL("https://declarations.cnil.fr/declarations-g-k.csv")
e <- getURL("https://declarations.cnil.fr/declarations-l-m.csv")
f <- getURL("https://declarations.cnil.fr/declarations-n-r.csv")
g <- getURL("https://declarations.cnil.fr/declarations-s-z.csv")
h <- getURL("https://declarations.cnil.fr/declarations-autres.csv")

aa <- read.csv(text = a, skip = 1, sep=';', quote = "")
bb <- read.csv(text = b, skip = 1, sep=';', quote = "")
cc <- read.csv(text = c, skip = 1, sep=';', quote = "")
dd <- read.csv(text = d, skip = 1, sep=';', quote = "")
ee <- read.csv(text = e, skip = 1, sep=';', quote = "")
ff <- read.csv(text = f, skip = 1, sep=';', quote = "", header = F)
names(ff) <- names(aa)
gg <- read.csv(text = g, skip = 1, sep=';', quote = "")
hh <- read.csv(text = h, skip = 1, sep=';', quote = "")

eta <- read.csv("fr-en-adresse-et-geolocalisation-etablissements-premier-et-second-degre.csv", sep=';')
df <- do.call("rbind", list(aa, bb, cc, dd, ee, ff, gg, hh))

eta <- eta %>%
  mutate(address = tolower(Adresse)) %>%
  select(address)

df <- df %>%
  mutate(address = tolower(Organisme.déclarant.adresse))

m <- merge(eta, df, by.x = 'address', by.y = 'address')

ecole <- df %>%
  filter(grepl("^ECOLE", Organisme.déclarant.raison.sociale))
