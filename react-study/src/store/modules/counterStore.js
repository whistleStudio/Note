import { createSlice } from "@reduxjs/toolkit";

// 定义slice状态片段
const counterSlice = createSlice({
  name: "counter",
  initialState: { value: 0 },
  reducers: {
    increment: state => state.value++,
    decrement: state => state.value--,
    incrementByAmount: (state, action) => {
      state.value += action.payload;
    }
  }
})

// 导出action
export const { increment, decrement, incrementByAmount } = counterSlice.actions;

// 导出reducer
export default counterSlice.reducer;