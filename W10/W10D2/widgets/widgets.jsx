import React from "react";
import ReactDOM from "react-dom";
import Clock from "/frontend/clock";
import Tabs from "/frontend/tabs";

function Root() {
  const jsObs = [
    { title: "One", content: "I am the first" },
    { title: "Two", content: "Second pane here" },
    { title: "Three", content: "Third pane here" },
  ];
  return (
    <div>
      <Clock />
      <Tabs tabsArr={jsObs} />
    </div>
  );
}

document.addEventListener("DOMContentLoaded", () => {
  const root = document.getElementById("root");
  ReactDOM.render(<Root />, root);
});
