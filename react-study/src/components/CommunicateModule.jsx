import { useState, createContext, useContext } from "react"

const MsgContext = createContext()


function Father ({children}) {
  const [msg, setMsg] = useState("")
  const getMsg = msg => {
    setMsg(msg)
  }
  const name = "ffff"
  return <>
    <div>im father</div>
    <MsgContext.Provider value={msg}>
      <Son name={name} onGetMsg={getMsg}></Son>
      <Son2 msg={msg}/>
    </MsgContext.Provider>
    xxxx{children}
    {msg}
  </>
}

function Son ({ name, onGetMsg }) {
  console.log(onGetMsg)
  const msg = "this is a msg from son"
  return <>
    <div>im son</div>
    <div>from father: {name}</div>
    <button onClick={() => onGetMsg(msg)}>send father msg</button>
    <GrandSon />
  </>
}

function Son2 ({msg}) {
  return <div>
    im son2:
    <span>{msg}</span>
  </div>
}

function GrandSon () {
  const msg = useContext(MsgContext)
  return <>
    im grandson:
    <span>{msg}</span>
  </>
}

export default function CommunicateModule() {
  return <>
    <Father>
    </Father>
  </>;
}
