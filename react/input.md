# Input

## Issues

### TBD

```log
Warning: A component is changing an uncontrolled input to be controlled. This is likely caused by the value changing from undefined to a defined value, which should not happen. Decide between using a controlled or uncontrolled input element for the lifetime of the component. More info: https://reactjs.org/link/controlled-components
```

<!--
https://stackoverflow.com/questions/37427508/react-changing-an-uncontrolled-input
-->

<!--
const [name, setName] = useState('')
-->

<!--
from: firstName: profile?.firstName,
to: firstName: profile?.firstName ?? '',
-->

TODO

### TBD

```log
Warning: You provided a `value` prop to a form field without an `onChange` handler. This will render a read-only field. If the field should be mutable use `defaultValue`. Otherwise, set either `onChange` or `readOnly`.
```

TODO

### TBD

```log
Argument of type 'string' is not assignable to parameter of type '{ [key: string]: any; }'. ts(2345)
```

TODO
