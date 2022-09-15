<?php
namespace app\controller;

use app\BaseController;
use app\model\ArticleModel;
use app\Request;
use think\facade\View;

class Article extends BaseController
{
    protected $user_info = [];
    protected $model;

    protected function initialize()
    {
        parent::initialize();
        $this->model = new ArticleModel();
    }

    public function index(string $cat_id = '')
    {
        View::assign('title', '文章列表 - 管理中心');
        $where = ['is_delete' => 0];
        if ($cat_id > 0) {
            $where['find_in_set']['cat_id'] = (string)$cat_id;
        }
        $list_data = $this->model->list_data($where);
        View::assign('list', $list_data->items());
        View::assign('pages', $list_data->render());
        View::assign('cat_id', $cat_id);
        return view();
    }

    public function add(Request $request)
    {
        if ($request->isPost()) {
            // handle for post
            $title = $request->post('title');
            $content = $request->post('content');
            $cat_id = array_to_string($request->post('cat_id'));
            if (empty($cat_id)) {
                return json(['error_msg' => '分类必须选择']);
            }
            $data = [
                'uid' => $this->user_info['id'],
                'title' => $title,
                'content' => $content,
                'cat_id' => $cat_id,
                'read_num' => 0,
                'is_delete' => 0,
                'add_time' => time(),
                'update_time' => 0,
            ];
            $res = $this->model->save($data);
            if ($res) {
                return json(['error_msg' => '']);
            }
            return json(['error_msg' => '添加失败']);
        }
        View::assign('title', '添加文章 - 管理中心');
        return view();
    }

    public function edit(Request $request)
    {
        if ($request->isPost()) {
            // handle for post
            $id = $request->post('id');
            $title = $request->post('title');
            $content = $request->post('content');
            $cat_id = array_to_string($request->post('cat_id'));
            if (empty($cat_id)) {
                return json(['error_msg' => '分类必须选择']);
            }
            $data = [
                'title' => $title,
                'content' => $content,
                'cat_id' => $cat_id,
                'update_time' => time(),
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
            return Redirect('/article/index');
        }
        $info = $info->toArray();
        View::assign('title', '编辑文章 - 管理中心');
        View::assign('info', $info);
        return view();
    }

    public function del(Request $request)
    {
        $id = $request->get('id');
        $this->model->where(['id' => $id])->update(['is_delete' => 1]);
        return Redirect('/Article/index');
    }
}
