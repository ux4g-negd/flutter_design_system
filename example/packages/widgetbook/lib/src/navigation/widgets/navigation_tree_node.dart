import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../nodes/nodes.dart';
import 'navigation_tree_tile.dart';

@internal
class NavigationTreeNode extends StatefulWidget {
  const NavigationTreeNode({
    super.key,
    required this.node,
    this.selectedNode,
    this.onNodeSelected,
    this.enableLeafComponents = true,
  });

  final WidgetbookNode node;
  final WidgetbookNode? selectedNode;
  final ValueChanged<WidgetbookNode>? onNodeSelected;
  final bool enableLeafComponents;

  @override
  State<NavigationTreeNode> createState() => _NavigationTreeNodeState();
}

class _NavigationTreeNodeState extends State<NavigationTreeNode> {
  late bool isExpanded;

  /// Check if the selected node is a descendant of this node.
  bool _containsSelectedNode() {
    final selectedPath = widget.selectedNode?.path;
    if (selectedPath == null) return false;
    // If the selected node's path starts with this node's path,
    // then the selected node is a descendant of this node.
    final nodePath = widget.node.path;
    return selectedPath.startsWith(nodePath) && selectedPath != nodePath;
  }

  @override
  void initState() {
    super.initState();
    // If this node contains the initially selected node, expand it.
    isExpanded = widget.node.isInitiallyExpanded || _containsSelectedNode();
  }

  @override
  void didUpdateWidget(covariant NavigationTreeNode oldWidget) {
    super.didUpdateWidget(oldWidget);
    // When the selected node changes, auto-expand this node if
    // the newly selected node is one of its descendants.
    // Never auto-collapse — only the user's explicit tap should collapse.
    if (widget.selectedNode?.path != oldWidget.selectedNode?.path) {
      if (_containsSelectedNode() && !isExpanded) {
        setState(() => isExpanded = true);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    const animationDuration = Duration(
      milliseconds: 200,
    );

    final isLeafComponent =
        widget.enableLeafComponents &&
        widget.node is WidgetbookComponent &&
        widget.node.children?.length == 1;

    // Redirect interactions to the use-case of the leaf component,
    // so that when it's clicked, the route is updated to the use-case
    // of the leaf component, and not the leaf component itself.
    final targetNode = isLeafComponent
        ? widget.node.children!.first
        : widget.node;

    final isLeafOrLeafComponent = widget.node.isLeaf || isLeafComponent;

    return Column(
      children: [
        NavigationTreeTile(
          node: widget.node,
          isExpanded: isExpanded,
          isSelected: targetNode.path == widget.selectedNode?.path,
          enableLeafComponents: widget.enableLeafComponents,
          onTap: () {
            if (isLeafOrLeafComponent) {
              // Leaf nodes (use-cases) and leaf components should
              // only trigger selection, not toggle expansion.
              widget.onNodeSelected?.call(targetNode);
            } else {
              // Non-leaf nodes (folders, categories, components)
              // should toggle expansion on tap.
              setState(() => isExpanded = !isExpanded);
              // Only call onNodeSelected for leaf-like behavior;
              // for branches, just toggle expand/collapse.
            }
          },
        ),
        if (widget.node.children != null && !isLeafComponent)
          ClipRect(
            child: AnimatedSlide(
              duration: animationDuration,
              curve: Curves.easeInOut,
              offset: Offset(0, isExpanded ? 0 : -1),
              child: AnimatedAlign(
                duration: animationDuration,
                curve: Curves.easeInOut,
                alignment: Alignment.topCenter,
                heightFactor: isExpanded ? 1 : 0,
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: widget.node.children!.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) => NavigationTreeNode(
                    key: ValueKey(widget.node.children![index].path),
                    node: widget.node.children![index],
                    selectedNode: widget.selectedNode,
                    onNodeSelected: widget.onNodeSelected,
                    enableLeafComponents: widget.enableLeafComponents,
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
