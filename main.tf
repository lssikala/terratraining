# Terraform.io/docs/configuration-0-11 and older documentation

# Syntax reference:

/* Single line comments start with #.
#"Multi-line comments are wrapped with /* and */
#Value are assigned with the syntax of key = value.
#Strings are in double-quotes.
#Strings can interpolate other values using syntax wrapped in ${}, for example ${var.foo}.
#Numbers are assumed to be base 10.
#Boolean values: true, false
#Lists of primitive types can be made with square brackets ([]), for example ["foo", "bar", "baz"].
#Maps can be made with braces ({}) and colons (:), for example { "foo": "bar", "bar": "baz" }." */ 

# Download the latest ghost image
/* 1st PARAMETER - Resource type will be "docker_image" or "aws_instance" 
   2nd PARAMETER - Resource name "image_id" or "web", for two words add underscore
   Meta-parameters like count, depends_on can be added.*/

resource "docker_image" "image_id" {
  name = "ghost:latest"
}

# Start the Container
resource "docker_container" "container_id" {

# 1st argument is name
  name  = "ghost_blog"

# 2nd argument is image with an interpolation syntax used for variables, attributes of resources or call functions, etc.
# starts with $ then {attribute or variable.the name of attribute or variable}
# e.g. "${resource (docker_image).resource name (image.id).attribute (latest)}

  image = "${docker_image.image_id.latest}"
  ports {
    internal = "2368"
    external = "80"
  }
}
