final: prev: {
  ollama-cuda61 = prev.ollama-cuda.override {
    cudaArches = ["61"];
  };
}
