<?php
namespace app\model;

use think\Model;

class ArticleModel extends Model
{
    protected $name = 'article';

    public function list_data(array $where = [])
    {
        return self::where($where)->field("id,uid,cat_id,title,content,read_num,add_time,update_time,is_delete")->order('add_time', 'desc')->paginate(10, true);
    }
}