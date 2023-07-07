from transformers import pipeline
from transformers import AutoTokenizer
import torch
# unmasker = pipeline('fill-mask', model='bert-base-uncased')
# res = unmasker("Hello I'm a [MASK] model.")
# print(res)
    # create tokenizer
tokenizer = AutoTokenizer.from_pretrained('/mnt/model/bloom-7b1', padding_side='right')
tokenizer.pad_token_id = tokenizer.eos_token_id
def tokeninze(query):
    # encode
    encoded_inputs = tokenizer(query, padding=True, return_tensors='pt')
    input_token_ids = encoded_inputs['input_ids'].int()
    input_lengths = encoded_inputs['attention_mask'].sum(
            dim=-1, dtype=torch.int32).view(-1, 1)
    return input_token_ids, input_lengths

ids1, ids2 = tokeninze("deepspeed is")
print(ids1)

decode_value = torch.tensor([[705, 71843, -1,   632]])
decoded = tokenizer.batch_decode(decode_value)
print(decoded)
#tokenizer.decode()