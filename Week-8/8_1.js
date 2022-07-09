class TreeNode
{
  constructor(value)
  {
    this.value = value;
    this.left = null;
    this.right = null;
  }
}

let root = null;

function createBSTRecur(root, key)
{
  if(root === null)
  {
    root = new TreeNode(key);
    return root;
  }

  if(key < root.value)
  {
    root.left = createBSTRecur(root.left, key);
  }
  else if (key > root.value)
  {
    root.right = createBSTRecur(root.right, key);
  }

  return root;
}

function createBST(arr)
{
  for(let a of arr)
  {
    root = createBSTRecur(root, a);
  }
}

//finding Maximum Depth of Binary Tree
let maxDepth = function(root) {
    if (root === null) return 0;
    return 1 + Math.max(maxDepth(root.left) , maxDepth(root.right));
};

createBST([20,10,5,15,30,25,35]);
console.log(maxDepth(root));