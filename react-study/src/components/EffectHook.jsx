import { use, useEffect, useState } from "react";

function useToggle () {
  const [flag, setFlag] = useState(false)
  const toggle = () => setFlag(!flag)
  return [flag, toggle]
}


function EffectTest () {
  useEffect(() => {
    // fetchData();
    console.log('effect invoked');
    const tim = setInterval(() => {
      console.log('timer invoked');
    }, 1000);
    return () => {
      console.log('effect cleanup');
      clearInterval(tim);
    }
  }, []);
  return <>effect test</>
}

export default function EffectHook() {
  const [list, setList] = useState([]);

  const [flag, toggleFlag] = useToggle();

  async function fetchData() {
    const res = await fetch('https://jsonplaceholder.typicode.com/posts');
    const data = await res.json();
    setList(data);
  }

  return <>
    {/* <ul>
      {list.map(item => <li key={item.id}>{item.title}</li>)}
    </ul> */}
    <button onClick={toggleFlag}>toggle</button>
    {flag && <EffectTest />}

  </>;
}
