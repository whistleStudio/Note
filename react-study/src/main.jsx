import { StrictMode } from 'react'
import { createRoot } from 'react-dom/client'
import './index.css'
import App from './App.jsx'
import store from './store/index.js'
import { Provider } from 'react-redux'
import { RouterProvider } from 'react-router-dom'
import router from './router/index.jsx'

createRoot(document.getElementById('root')).render(
  <StrictMode>
    {/* <Provider store={store}> */}
    <RouterProvider router={router}>
      <App />
    </RouterProvider>
    {/* </Provider> */}
  </StrictMode>,
)
  