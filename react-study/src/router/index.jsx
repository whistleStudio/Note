import Login from "../pages/Login";
import Article from "../pages/Article";
import NotFound from "../pages/NotFound";
import App from "../App";

import { createBrowserRouter, createHashRouter} from "react-router-dom";

const router = createBrowserRouter([
  {
    path: "/",
    element: <App />,
    children: [
      {
        index: true,
        element: <Login />,
      },
      {
        path: "/article/:id?",
        element: <Article />,
      }
    ],
  },
  // {
  //   path: "/login",
  //   element: <Login />,
  // },
  // {
  //   path: "/article/:id",
  //   element: <Article />,
  // },
  {
    path: "*",
    element: <NotFound />,
  }
]);

export default router;
