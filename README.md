# Hybrid Network Topology in Scilab

This repository contains a Scilab implementation of a hybrid computer network topology combining **star**, **ring**, and **bus** structures with a total of **25 nodes**. The code was developed as part of a Computer Networks laboratory assignment.

## Features

- Builds a hybrid topology using:
  - Star topology (nodes 1–10, central hub at node 1)  
  - Ring topology (nodes 11–20)  
  - Bus topology (nodes 21–25)  
- Uses an adjacency matrix to define all links between nodes.  
- Displays the complete network graph with:
  - Node numbers  
  - Color‑coded nodes and edges for each topology segment  
- Prints:
  - Degree (number of edges) of every node  
  - Node with maximum degree  
  - Total number of nodes and edges in the network  

## Files

- `Hybrid.sce` – Main Scilab script to generate and analyze the topology.  
- `Network Topology Creation using Scilab (2).docx` – Assignment report with code, outputs, and scenario-based questions/answers.  
- `Hybrid Topology` – Sample output figures from Scilab (topology visualization and console output).

## How to Run

1. Open Scilab.  
2. Change directory to the folder containing the script:  
   ```scilab
   cd "path\to\this\repository"
   ```
3. Execute the script:  
   ```scilab
   exec("hybrid_topology.sce", -1)
   ```
4. View the generated topology in the graphics window and the analysis in the console.
