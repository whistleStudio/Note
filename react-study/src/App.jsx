import { useRef, useState } from 'react'
import reactLogo from './assets/react.svg'
import viteLogo from '/vite.svg'
import './App.css'
import CommentList from './components/CommentList'
import CommunicateModule from './components/CommunicateModule'
import EffectHook from './components/EffectHook'



function App() {
  return <>
    {/* <EffectHook /> */}
    <CommentList />
    {/* <CommunicateModule /> */}
  </>
}

export default App
