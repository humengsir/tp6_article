<?php
namespace app\controller;

use app\BaseController;
use app\model\CategoryModel;
use app\Request;
use think\facade\View;

class Category extends BaseController
{
    protected $user_info = [];
    protected $model;

    protected function initialize()
    {
        parent::initialize();
        $this->model = new CategoryModel();
    }

    public function index()
    {
        View::assign('title', '文章分类列表 - 管理中心');
        View::assign('list', get_all_category());
        return view();
    }

    public function add(Request $request)
    {
        if ($request->isPost()) {
            // handle for post
            $cat_name = $request->post('cat_name');
            $data = [
                'cat_name' => $cat_name,
            ];
            $res = $this->model->save($data);
            if ($res) {
                return json(['error_msg' => '']);
            }
            return json(['error_msg' => '添加失败']);
        }
        View::assign('title', '添加文章分类 - 管理中心');
        return view();
    }

    public function edit(Request $request)
    {
        if ($request->isPost()) {
            // handle for post
            $id = $request->post('id');
            $cat_name = $request->post('cat_name');
            $data = [
                'cat_name' => $cat_name,
            ];
            $res = $this->model->where(['id' => $id])->update($data);
            if ($res) {
                return json(['error_msg' => '']);
            }
            return json(['error_msg' => '编辑失败']);
        }
        $id = $request->get('id');
        $info = $this->model->where(['id' => $id])->find();
        if (!$info) {
            return Redirect('/category/index');
        }
        $info = $info->toArray();
        View::assign('title', '编辑文章分类 - 管理中心');
        View::assign('info', $info);
        return view();
    }

    public function del(Request $request)
    {
        $id = $request->get('id');
        $this->model->where(['id' => $id])->delete();
        return Redirect('/category/index');
    }
}
