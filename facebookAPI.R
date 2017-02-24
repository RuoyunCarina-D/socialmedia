library(devtools)
install_github("Rfacebook", "pablobarbera", subdir="Rfacebook")
require (Rfacebook)

app_id = "***"
app_secret = "***"
fb_oauth <- fbOAuth(app_id=app_id, app_secret=app_secret,extended_permissions = TRUE)

me <- getUsers("me",token=fb_oauth)
my_likes <- getLikes(user="me", token=fb_oauth)

token = "***"
me <- getUsers("me", token, private_info=TRUE)
getUsers(c("barackobama", "donaldtrump"), token)

# Sad news: Facebook now can only fetch information of friends who had used development app rather than all friends
my_friends <- getFriends(token, simplify = F)
head(my_friends$id, n = 1)
my_friends_info <- getUsers(my_friends$id, token, private_info = TRUE)

mat <- getNetwork(token, format = "adj.matrix")
singletons <- rowSums(mat)==0
my_graph <- graph.adjacency(mat[!singletons,!singletons])
plot(my_graph)
dim(mat)

