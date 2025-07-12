<?php
declare(strict_types=1);

namespace App\Controller;

/**
 * ModelsImages Controller
 *
 * @property \App\Model\Table\ModelsImagesTable $ModelsImages
 */
class ModelsImagesController extends AppController
{
    /**
     * Index method
     *
     * @return \Cake\Http\Response|null|void Renders view
     */
    public function index()
    {
        $query = $this->ModelsImages->find()
            ->contain(['Images']);
        $modelsImages = $this->paginate($query);

        $this->set(compact('modelsImages'));
    }

    /**
     * View method
     *
     * @param string|null $id Models Image id.
     * @return \Cake\Http\Response|null|void Renders view
     * @throws \Cake\Datasource\Exception\RecordNotFoundException When record not found.
     */
    public function view($id = null)
    {
        $modelsImage = $this->ModelsImages->get($id, contain: ['Images']);
        $this->set(compact('modelsImage'));
    }

    /**
     * Add method
     *
     * @return \Cake\Http\Response|null|void Redirects on successful add, renders view otherwise.
     */
    public function add()
    {
        $modelsImage = $this->ModelsImages->newEmptyEntity();
        if ($this->request->is('post')) {
            $modelsImage = $this->ModelsImages->patchEntity($modelsImage, $this->request->getData());
            if ($this->ModelsImages->save($modelsImage)) {
                $this->Flash->success(__('The models image has been saved.'));

                return $this->redirect(['action' => 'index']);
            }
            $this->Flash->error(__('The models image could not be saved. Please, try again.'));
        }
        $images = $this->ModelsImages->Images->find('list', limit: 200)->all();
        $this->set(compact('modelsImage', 'images'));
    }

    /**
     * Edit method
     *
     * @param string|null $id Models Image id.
     * @return \Cake\Http\Response|null|void Redirects on successful edit, renders view otherwise.
     * @throws \Cake\Datasource\Exception\RecordNotFoundException When record not found.
     */
    public function edit($id = null)
    {
        $modelsImage = $this->ModelsImages->get($id, contain: []);
        if ($this->request->is(['patch', 'post', 'put'])) {
            $modelsImage = $this->ModelsImages->patchEntity($modelsImage, $this->request->getData());
            if ($this->ModelsImages->save($modelsImage)) {
                $this->Flash->success(__('The models image has been saved.'));

                return $this->redirect(['action' => 'index']);
            }
            $this->Flash->error(__('The models image could not be saved. Please, try again.'));
        }
        $images = $this->ModelsImages->Images->find('list', limit: 200)->all();
        $this->set(compact('modelsImage', 'images'));
    }

    /**
     * Delete method
     *
     * @param string|null $id Models Image id.
     * @return \Cake\Http\Response|null Redirects to index.
     * @throws \Cake\Datasource\Exception\RecordNotFoundException When record not found.
     */
    public function delete($id = null)
    {
        $this->request->allowMethod(['post', 'delete']);
        $modelsImage = $this->ModelsImages->get($id);
        if ($this->ModelsImages->delete($modelsImage)) {
            $this->Flash->success(__('The models image has been deleted.'));
        } else {
            $this->Flash->error(__('The models image could not be deleted. Please, try again.'));
        }

        return $this->redirect(['action' => 'index']);
    }
}
