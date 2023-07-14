import torch
import logging
logging.basicConfig(format='[%(asctime)s] %(filename)s %(funcName)s():%(lineno)i [%(levelname)s] %(message)s', level=logging.DEBUG)
#model = torch.load("/mnt/model/megatron_lm_345m/release/mp_rank_00/model_optim_rng.pt")
model = torch.load("/mnt/model/llama-7b-hf/pytorch_model-00033-of-00033.bin")
logging.info(f"model keys:{model.keys()}")

space="-"
def dfs(state_dict, level):
    for k, v in state_dict.items():
        print(f"{space*2*level}{k}")
        if isinstance(v, dict):
            dfs(v, level + 1)
dfs(model, 1)