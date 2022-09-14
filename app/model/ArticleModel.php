<?php
namespace app\model;

use think\Model;

class ArticleModel extends Model
{
    protected $name = 'article';

    public function list_data(array $where = [])
    {
        $model = self::field("id,uid,cat_id,title,content,read_num,add_time,update_time,is_delete");
        if (isset($where['find_in_set'])) {
            foreach ($where['find_in_set'] as $field_name => $value) {
                $model = $model->where($field_name, 'find in set', $value);
            }
            unset($where['find_in_set']);
        }
        return $model->where($where)->order('add_time', 'desc')->paginate(1, true);
    }
}