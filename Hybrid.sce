// ============================================================
// HYBRID NETWORK TOPOLOGY - COLORED BY TOPOLOGY
// Star (1-10), Ring (11-20), Bus (21-25)
// ============================================================

clear
clc

// ---------- PART 1: ADJACENCY MATRIX (25 nodes) --------------
adj = zeros(25, 25);

// Star topology: nodes 1-10, node 1 is hub
for i = 2:10
    adj(1, i) = 1;
    adj(i, 1) = 1;
end

// Ring topology: nodes 11-20
for i = 11:19
    adj(i, i+1) = 1;
    adj(i+1, i) = 1;
end
adj(20, 11) = 1;
adj(11, 20) = 1;

// Bus topology: nodes 21-25 (linear)
for i = 21:24
    adj(i, i+1) = 1;
    adj(i+1, i) = 1;
end

// Bridges: connect star–ring and ring–bus
adj(1, 11) = 1;  adj(11, 1) = 1;
adj(20, 21) = 1; adj(21, 20) = 1;

// ---------- PART 2: NODE COORDINATES FOR PLOTTING ------------
n = 25;
x = [];
y = [];

// Star positions (nodes 1-10)
for i = 1:10
    if i == 1 then
        x = [x, 0];
        y = [y, 0];
    else
        angle = (i-2) * 2 * %pi / 9;
        x = [x, 3 * cos(angle)];
        y = [y, 3 * sin(angle)];
    end
end

// Ring positions (nodes 11-20)
for i = 11:20
    angle = (i-11) * 2 * %pi / 10;
    x = [x, 9 + 2.5 * cos(angle)];
    y = [y, 2.5 * sin(angle)];
end

// Bus positions (nodes 21-25)
for i = 21:25
    x = [x, 15 + (i-21)];
    y = [y, 0];
end

// ---------- PART 3: PLOT TOPOLOGY WITH COLORS ----------------
scf(1);
clf();

// --- Draw edges with different colors ---
// Star edges (1–2..10): BLUE
for i = 2:10
    if adj(1, i) == 1 then
        plot([x(1) x(i)], [y(1) y(i)], 'b-', 'thickness', 1);
    end
end

// Ring edges (11–20): BLACK
for i = 11:19
    if adj(i, i+1) == 1 then
        plot([x(i) x(i+1)], [y(i) y(i+1)], 'k-', 'thickness', 1);
    end
end
if adj(20, 11) == 1 then
    plot([x(20) x(11)], [y(20) y(11)], 'k-', 'thickness', 1);
end

// Bus edges (21–25): MAGENTA
for i = 21:24
    if adj(i, i+1) == 1 then
        plot([x(i) x(i+1)], [y(i) y(i+1)], 'm-', 'thickness', 1);
    end
end

// Bridge edges: keep neutral (cyan)
if adj(1, 11) == 1 then
    plot([x(1) x(11)], [y(1) y(11)], 'c-', 'thickness', 1);
end
if adj(20, 21) == 1 then
    plot([x(20) x(21)], [y(20) y(21)], 'c-', 'thickness', 1);
end

// --- Draw nodes with requested colors ---
// Star nodes: RED
for i = 1:10
    plot(x(i), y(i), 'ro', 'marksize', 10);
end

// Ring nodes: GREEN
for i = 11:20
    plot(x(i), y(i), 'go', 'marksize', 10);
end

// Bus nodes: YELLOW
for i = 21:25
    plot(x(i), y(i), 'yo', 'marksize', 10);
end

// Number the nodes
for i = 1:n
    xstring(x(i), y(i) + 0.3, string(i));
end

title("Hybrid Network Topology (Star + Ring + Bus)");
xlabel("X");
ylabel("Y");
axis("equal");
grid("on");

// ---------- PART 4: DEGREE + MAX DEGREE ----------------------
degrees = sum(adj, 2);
[max_degree, max_node] = max(degrees);

disp("===== NODE DEGREES =====");
for i = 1:n
    mprintf("Node %2d : %2d edges\n", i, degrees(i));
end
mprintf("\nNode with maximum edges: Node %d with %d edges\n", max_node, max_degree);

// ---------- PART 5: TOTAL NODES & EDGES ----------------------
total_nodes = n;
total_edges = sum(adj) / 2;

disp(" ");
disp("===== NETWORK SUMMARY =====");
mprintf("Total number of nodes : %d\n", total_nodes);
mprintf("Total number of edges : %d\n", total_edges);
