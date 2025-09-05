import { useSearchParams, useParams } from "react-router-dom";

function Article () {
  const [searchParams] = useSearchParams();
  const { id } = useParams();
  return <div>Article {id}</div>;
}

export default Article;