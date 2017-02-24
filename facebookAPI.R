library(devtools)
install_github("Rfacebook", "pablobarbera", subdir="Rfacebook")
require (Rfacebook)

app_id = "254348755008159"
app_secret = "a95d5c129547bedcc6de93c1a39b6b06"
fb_oauth <- fbOAuth(app_id=app_id, app_secret=app_secret,extended_permissions = TRUE)

me <- getUsers("me",token=fb_oauth)
my_likes <- getLikes(user="me", token=fb_oauth)

token = "EAACEdEose0cBAHNydNnT4uSstESrRzj8CSsI3q8yGdi8R9AFbO0qhUz3NXt52czoPmGpsXkoE0P5BcbClHyAvSe6AxZAymc4ee7D2P6al3PLcvIKflBecYRkh9WClwOSWoFR7IcEKeMPZCNhVqTo48oIEZAcS9IBKTaZCzpSkngv1QdC8EcJzSw5tnsorQMZD"
me <- getUsers("me", token, private_info=TRUE)
getUsers(c("barackobama", "donaldtrump"), token)

my_friends <- getFriends(token, simplify = F)
head(my_friends$id, n = 1)
my_friends_info <- getUsers(my_friends$id, token, private_info = TRUE)

mat <- getNetwork(token, format = "adj.matrix")
singletons <- rowSums(mat)==0
my_graph <- graph.adjacency(mat[!singletons,!singletons])
plot(my_graph)
dim(mat)

