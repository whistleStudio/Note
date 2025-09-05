import { useRef, useState } from 'react'
import './App.css'
import CommentList from './components/CommentList'
import CommunicateModule from './components/CommunicateModule'
import EffectHook from './components/EffectHook'
// import ReduxDemo from './components/ReduxDemo'
import ReactRouterDemo from './components/ReactRouterDemo' 
import { Link, Outlet } from 'react-router-dom'

function App() {
  return <>
    APP
    {/* <EffectHook /> */}
    {/* <ReactRouterDemo /> */}
    <Link to="/">Go to Login</Link>
    <Link to="/article">Go to Article</Link>
    <Outlet></Outlet>
    {/* <ReduxDemo /> */}
    {/* <CommentList /> */}
    {/* <CommunicateModule /> */}
  </>
}

export default App
