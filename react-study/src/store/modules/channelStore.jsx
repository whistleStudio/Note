import { createSlice } from "@reduxjs/toolkit";

const channelSlice = createSlice({
  name: "channel",
  initialState: { value: [] },
  reducers: {
    setChannel: (state, action) => {
      state.value = action.payload;
    }
  }
})

const {setChannel} = channelSlice.actions;

// 异步请求
// export const fetchChannels = async (dispatch) => {
//   const response = await fetch('http://localhost:3000/data');
//   const data = await response.json();
//   dispatch(setChannel(data));
// }

// 写法二
export const fetchChannels = () => async (dispatch) => {
  const response = await fetch('http://localhost:3000/data');
  const data = await response.json();
  dispatch(setChannel(data));
};

export default channelSlice.reducer;