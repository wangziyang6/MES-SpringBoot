package com.songpeng.sparchetype.common.util;

import com.songpeng.sparchetype.system.vo.TreeVO;

import java.util.ArrayList;
import java.util.List;

/**
 *
 */
public class TreeUtil {

    public static <T> TreeVO<T> build(List<TreeVO<T>> nodes) {

        if (nodes == null) {
            return null;
        }
        List<TreeVO<T>> topNodes = new ArrayList<TreeVO<T>>();

        for (TreeVO<T> children : nodes) {

            String pid = children.getParentId();
            if (pid == null || "0".equals(pid)) {
                topNodes.add(children);

                continue;
            }

            for (TreeVO<T> parent : nodes) {
                String id = parent.getId();
                if (id != null && id.equals(pid)) {
                    parent.getChildren().add(children);
                    children.setHasParent(true);
                    parent.setHasChildren(true);
                    continue;
                }
            }

        }

        TreeVO<T> root = new TreeVO<T>();
        if (topNodes.size() == 1) {
            root = topNodes.get(0);
        } else {
            root.setId("-1");
            root.setParentId("");
            root.setHasParent(false);
            root.setHasChildren(true);
            root.setChecked(true);
            root.setChildren(topNodes);
            root.setName("顶级节点");
        }

        return root;
    }

    public static <T> List<TreeVO<T>> buildList(List<TreeVO<T>> nodes, String idParam) {
        if (nodes == null) {
            return null;
        }
        List<TreeVO<T>> topNodes = new ArrayList<TreeVO<T>>();

        for (TreeVO<T> children : nodes) {

            String pid = children.getParentId();
            if (pid == null || idParam.equals(pid)) {
                topNodes.add(children);

                continue;
            }

            for (TreeVO<T> parent : nodes) {
                String id = parent.getId();
                if (id != null && id.equals(pid)) {
                    parent.getChildren().add(children);
                    children.setHasParent(true);
                    parent.setHasChildren(true);

                    continue;
                }
            }

        }
        return topNodes;
    }

}