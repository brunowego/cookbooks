# HashiCorp Configuration Language (HCL)

## Syntax

- Human readable and editable
- Configuration syntax and expressions
- Conditionals, functions, templates

### Blocks

```hcl
block_type label_one label_two {
  key = value
  embedded_block {
    key = value
  }
}
```

### Object Types

```hcl
string = "string"
number = 1
bool = true
list = ["string1", "string2"]
map = {name = "John", age = 35, admin = true}
```

### References

```hcl
var.example
local.example.name
module.example.property
```

**Interpolation**

```hcl
project_name = "my-${var.app}"
```

### Provisioners

- Last resort
- Local or remote
- Creation or destruction
- Multiple provisioners

```hcl
provisioner "file" {
  connection {
    type = "ssh"
    user = "root"
    private_key = var.private_key
    host = var.hostname
  }
  source = "/local/path/to/file.txt"
  destination = "/path/to/file.txt"
}

provisioner "local-exec" {
  command = "local command here"
}

provisioner = "remote-exec" {
  scripts = ["list", "of", "local", "scripts"]
}
```

<!-- ### Functions -->

<!--
merge
file
-->

## Tips

### Visual Studio Code

```sh
#
code --install-extension wholroyd.hcl

#
jq '."recommendations" += ["wholroyd.hcl"]' "$PWD"/.vscode/extensions.json | sponge "$PWD"/.vscode/extensions.json
```
