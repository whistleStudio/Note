import { Link, useNavigate } from 'react-router-dom'

function ReactRouterDemo() {
  const navigate = useNavigate()
  return (
    <>
      <div>ReactRouterDemo</div>
      <><Link to="/login">Login</Link> | <Link to="/article">Article</Link></>
      <button onClick={() => navigate('/login')}>Go to Login</button>
      <button onClick={() => navigate('/article?id=123')}>pass params</button>
      <button onClick={() => navigate('/article/1234')}>pass params2</button>
    </>
  )
}

export default ReactRouterDemo