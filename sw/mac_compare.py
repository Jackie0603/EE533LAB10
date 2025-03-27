import torch
import torch.nn as nn
import numpy as np
from sklearn.datasets import load_digits
from sklearn.model_selection import train_test_split
from sklearn.metrics import mean_squared_error
import pandas as pd

# Load data
digits = load_digits()
X, y = digits.images, digits.target
X_binary = np.where(X > 8, 1.0, 0.0).reshape(-1, 64).astype(np.float32)
X_train, X_test, y_train, y_test = train_test_split(X_binary, y, test_size=0.2, random_state=42)

# Convert to PyTorch tensors
X_train_tensor = torch.tensor(X_train, dtype=torch.float32)
y_train_tensor = torch.tensor(y_train, dtype=torch.long)
X_test_tensor = torch.tensor(X_test, dtype=torch.float32)
y_test_tensor = torch.tensor(y_test, dtype=torch.long)

# Define simple model
class MinimalFNN(nn.Module):
    def __init__(self):
        super(MinimalFNN, self).__init__()
        self.hidden = nn.Linear(64, 3, bias=False)
        self.output = nn.Linear(3, 10, bias=False)

    def forward(self, x):
        x = torch.relu(self.hidden(x))
        x = self.output(x)
        return x

model = MinimalFNN()
optimizer = torch.optim.SGD(model.parameters(), lr=0.5)
criterion = nn.CrossEntropyLoss()

# Train briefly
for epoch in range(10):
    optimizer.zero_grad()
    output = model(X_train_tensor)
    loss = criterion(output, y_train_tensor)
    loss.backward()
    optimizer.step()

# Save weights
hidden_weights = model.hidden.weight.detach().numpy()
output_weights = model.output.weight.detach().numpy()
np.savetxt("hidden_weights.txt", hidden_weights, fmt="%.5f")
np.savetxt("output_weights.txt", output_weights, fmt="%.5f")

# Compare predictions for a few samples
N = 10
software_preds = []
hardware_preds = []
mse_list = []

for i in range(N):
    x = X_test[i]
    true_label = y_test[i]

    # Software output
    x_tensor = torch.tensor(x, dtype=torch.float32)
    software_out = model(x_tensor).detach().numpy()
    software_class = np.argmax(software_out)

    # Simulated hardware: MAC + ReLU + MAC
    hidden_raw = np.dot(hidden_weights, x)
    hidden_relu = np.maximum(hidden_raw, 0)
    hardware_out = np.dot(output_weights, hidden_relu)
    hardware_class = np.argmax(hardware_out)

    # MSE between output vectors
    mse = mean_squared_error(software_out, hardware_out)

    software_preds.append(software_class)
    hardware_preds.append(hardware_class)
    mse_list.append(mse)

# Create table
df = pd.DataFrame({
    "Sample": list(range(N)),
    "True Label": y_test[:N],
    "Software Pred": software_preds,
    "Hardware Pred": hardware_preds,
    "MSE": mse_list
})

print(df.to_string(index=False))
print(f"\nAverage MSE: {np.mean(mse_list):.6f}")
