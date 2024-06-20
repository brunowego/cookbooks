# dotenv

## Library

### Links

- [Code Repository](https://github.com/dotenv-rs/dotenv)

### Installation

```sh
cargo add dotenv
```

### Configuration

```rs
use dotenv::dotenv;

pub async fn main() {
    dotenv().ok();

    // ...
}
```
