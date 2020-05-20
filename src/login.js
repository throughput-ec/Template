import styles from "./widget.scss";

const template = document.createElement("template");
template.innerHTML = `
  <style>${styles.toString()}</style>
  <ul>
    <slot>
      <p>You have nothing to do, yay!</p>
    </slot>
  </ul>
  <input id="new-item"/>
  <button>Add</button>
`;
