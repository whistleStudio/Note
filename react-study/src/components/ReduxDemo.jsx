import { useSelector, useDispatch } from "react-redux";
import { increment, decrement, incrementByAmount } from "../store/modules/counterStore";
import { use, useEffect } from "react";
import { fetchChannels } from "../store/modules/channelStore";

function ReduxDemo() {
  const counter = useSelector(state => state.counter.value);
  const channels = useSelector(state => state.channel.value);
  const dispatch = useDispatch();

  useEffect(() => {
    dispatch(fetchChannels());
  }, [dispatch]);



  return (
    <div>
      <h2>Redux Demo</h2>
      <p>Counter Value: {counter}</p>
      <button onClick={() => dispatch(increment())}>Increment</button>
      <button onClick={() => dispatch(decrement())}>Decrement</button>
      <button onClick={() => dispatch(incrementByAmount(5))}>Increment by 5</button>
      <h3>Channels: {JSON.stringify(channels)}</h3>
    </div>
  );
}

export default ReduxDemo;
