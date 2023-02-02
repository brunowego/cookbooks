# REST-assured

**Keywords:** Semi-DIY (Avoid boilerplate code)

## Links

- [Main Website](https://rest-assured.io/)
- [Code Repository](https://github.com/rest-assured/rest-assured)

## Guides

- [A Guide to REST-assured](https://www.baeldung.com/rest-assured-tutorial)

## Used For

- Web API/Service
- REST API

## Library

### Included

- [Hamcrest](/hamcrest.md)
- Apache HttpClient
  - HttpStatus

### Dependencies

- [JUnit Jupiter](/junit/junit-jupiter.md) or [TestNG](/testng.md)
- Mapping Library (Select One)
  - [Jackson Data-binding](/jackson/jackson-databind.md)
  - Gson
  - JSON-B

### Apache Maven

#### Project Object Model (POM)

```xml
<properties>
  <!-- ... -->
  <io.rest-assured.version>4.4.0</io.rest-assured.version>
</properties>

<dependencies>
  <!-- ... -->
  <dependency>
    <groupId>io.rest-assured</groupId>
    <artifactId>rest-assured</artifactId>
    <version>${io.rest-assured.version}</version>
    <scope>test</scope>
  </dependency>
</dependencies>
```

### Pattern

| Name  | Description                  |
| ----- | ---------------------------- |
| Given | Specify prerequisites        |
| When  | Describe the action to take  |
| Then  | Describe the expected result |

## DSL

### Method Chaining, Fluent Interface and Syntactic Sugar

```java
RestAssured.get(BASE_URL)
    .then()
    .assertThat() // Syntactic sugar
        .statusCode(200)
    .and().assertThat() // Syntactic sugar
        .header("h1", "val");
```

### Debugging Methods

```java
RestAssured.get(BASE_URL)
    // ...
    .peek()
    // or...
    .prettyPeek()
    // or...
    .print()
    // or...
    .prettyPrint();
```

### Getting the Headers

```java
Response response = RestAssured.get(BASE_URL);

response.getStatusCode();
response.getContentType();
response.getHeader(String header);
```

#### Headers

```java
Headers headers = response.getHeaders();
String val = headers.getValue(String header);
int size = headers.size();
List<Header> list = headers.asList();
boolean isPresent = headers.hasHeaderWithName(String header);
```

#### Time

```java
response.time();
response.getTime();
response.getTimeIn(TimeUnit.MINUTES);
```

### Hamcrest Matchers

```java
RestAssured.get(BASE_URL)
    .then()
    // ...
    .statusCode(200)
    // or...
    .statusCode(equalTo(200))
    // or...
    .statusCode(lessThan(300))
    // or...
    .statusCode(anyOf(equalTo(200), equalTo(202)))
    // or...
    .header("x", containsStringIgnoringCase("y"))
    // or...
    .header("etag", notNullValue())
    // or...
    .header("etag", not(emptyString()));
```

### Data Provider

```java
@DataProvider
public Object[][] names() {
    return new Object[][] {
        {"brunowego"},
        {"rest-assured"}
    };
}

@Test(dataProvider = "names")
public void complexBodyExampleWithDp(String name) {
    RestAssured.get(BASE_URL + "users/" + name)
        .then()
        .body("url", response -> Matchers.containsString(response.body().jsonPath().get("login")));
}
```

### Root Path

```java
RestAssured.get(BASE_URL)
    .then()
    .rootPath("node1.nested")
        .body("field1", equalTo(x))
        .body("field2", equalTo(y))
    .rootPath("node2.nested")
        .body("field1", equalTo(z))
    .noRootPath()
    .body("full.path.again", equalTo(a));
```

### Parser

```java
RestAssured.get(BASE_URL)
    .then()
    .using()
        .defaultParser(Parser.XML)
    .body("current_user_url", equalTo(BASE_URL + "user"));
```

### Unmarshalling

```java
@JsonIgnoreProperties(ignoreUnknown = true)
public class User {

    public String login;

    public int id;

    @JsonProperty("public_repos")
    public int publicRepos;

    public String getLogin() {
        return login;
    }

    public int getId() {
        return id;
    }

    public int getPublicRepos() {
        return publicRepos;
    }
}

User user = RestAssured.get(BASE_URL)
    .as(User.class);

assertEquals(user.getLogin(), "brunowego");
assertEquals(user.getId(), 441774);
assertEquals(user.getPublicRepos(), 54);
```

#### Object Mapper

```java
User user = RestAssured.get(BASE_URL)
    .as(User.class, ObjectMapperType.GSON);

// ...
```
