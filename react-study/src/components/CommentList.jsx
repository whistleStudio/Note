import { useState, useRef, useEffect } from 'react';

// const comments = [
//   { id: 1, author: "user1", content: "评论 1", like: 3, time: new Date() },
//   { id: 2, author: "user2", content: "评论 2", like: 2, time: new Date(new Date().getTime() + 1000 * 60) },
//   { id: 3, author: "user3", content: "评论 3", like: 1, time: new Date(new Date().getTime() + 1000 * 60 * 2) },
// ];


const loginUser = {
  name: "user1"
}

// 封装单条评论组件
function CommentItem({ cmt, onDelete }) {
  return (
    <li>
      <div>author: {cmt.author}</div>
      <div>content: {cmt.content}</div>
      <div>like: {cmt.like} </div>
      <div>time: {cmt.time.toLocaleString()}</div>
      {loginUser.name === cmt.author && (
        <button onClick={() => onDelete(cmt.id)}>删除</button>
      )}
    </li>
  );
}

// 自定义 Hook
const useFetchComments = () => {
  const [comments, setComments] = useState([]);

  useEffect(() => {
    const fetchComments = async () => {
      const res = await fetch("http://localhost:3000/data");
      const data = await res.json();
      setComments(data);
    };
    fetchComments();
  }, []);

  return {commentList:comments, setCommentList: setComments};
};

export default function CommentList() {
  const { commentList, setCommentList } = useFetchComments();
  const [tagIdx, setTagIdx] = useState(0);
  const [content, setContent] = useState('');
  const textareaRef = useRef();

  const handleDelete = (id) => {
    setCommentList(commentList.filter(cmt => cmt.id !== id));
  };

  const handleTagClick = (index) => {
    setTagIdx(index);
    switch(index) {
      case 1:
        setCommentList([...commentList].sort((a, b) => new Date(b.time).getTime() - new Date(a.time).getTime()));
        break;
      default:
        setCommentList([...commentList].sort((a, b) => b.like - a.like));
        break;
    }
    console.log(commentList);
  }

  return (
    <div>
      <div>
        <strong>评论列表  </strong>
        { ["最热", "最新"].map((item, index) => (
          <span key={index} style={{color: tagIdx === index && 'red', cursor: 'pointer'}} onClick={() => handleTagClick(index)}>{item}</span>
        ))}
      </div>
      <textarea ref={textareaRef} value={content} onChange={e => setContent(e.target.value)}></textarea>
      <button onClick={() => {
        if(!content.trim()) return alert('评论内容不能为空');
        setCommentList([...commentList, { id: Date.now(), author: loginUser.name, content, like: 0, time: new Date() }]);
        setContent('');
        textareaRef.current.focus();
      }}>发布</button>
      <ul>
        {commentList.map(cmt => (
          <CommentItem key={cmt.id} cmt={cmt} onDelete={handleDelete} />
        ))}
      </ul>
    </div>
  );
}
